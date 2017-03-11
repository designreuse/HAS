app.controller("userCtrl", function ($scope, $http, $location, $state, $stateParams, $timeout, $interval, $resource, DTOptionsBuilder, DTColumnBuilder) {
    var ctrl = this;
    $scope.page.title = "Users";
    $scope.master = {};
    $scope.rolesList = [];
    ctrl.filters = {
        username: "",
        email: "",
        roleID: 1
    };
    $scope.isEdit = false;

    if ($location.path().includes("list")) {
        $scope.getAllRoles(function (data) {
            var emptyArray = [
                {
                    id: -1,
                    roleName: "-- ALL --"
                }
            ];

            $scope.rolesList = emptyArray.concat(data);

            ctrl.filters.roleID = $scope.rolesList[0].id;
        });

        // users table
        $scope.dtInstance = {};
        $scope.dtOptions = DTOptionsBuilder.newOptions()
            .withOption('ajax', {
                url: 'users/search',
                type: 'GET',
                dataType: "json",
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                    'Authorization': $scope.authentication
                },
                data: ctrl.filters,
                error: function (jqXHR, textStatus, errorThrown) {
                    $scope.displayMessage({
                        status: jqXHR.status,
                        error: jqXHR.statusText,
                        message: jqXHR.responseText
                    });
                }
            })
            .withDataProp('data')
            .withOption('responsive', true)
            .withOption('processing', true)
            .withOption('serverSide', true)
            .withOption('pagingType', 'full_numbers')
            .withOption('dom', 'lrtip');

        $scope.dtColumns = [
            DTColumnBuilder.newColumn('id', 'ID'),
            DTColumnBuilder.newColumn('username', 'Username'),
            DTColumnBuilder.newColumn('email', 'E-Mail'),
            DTColumnBuilder.newColumn('userRole.roleName', 'Role'),
            DTColumnBuilder.newColumn('regDate', 'Registration Date')
                .renderWith(function (date) {
                    return new Date(date).toLocaleDateString();
                }),
            DTColumnBuilder.newColumn('lastLogin', 'Last Login')
                .renderWith(function (date) {
                    return new Date(date).toLocaleString();
                }),
            DTColumnBuilder.newColumn('id').notSortable().withClass('actions-column')
                .renderWith(function (id) {
                    var html =
                        '<div class="btn-group btn-group-sm">' +
                        '<a class="btn btn-default action-btn" href="#!/users/edit/' +
                        id + '"><i class="fa fa-pencil" aria-hidden="true"></i></a>' +
                        '<button class="btn btn-default action-btn delete-btn" id="del_' +
                        id + '"><i class="fa fa-trash-o" aria-hidden="true"></i></button>' +
                        '</div>';
                    return html;
                })
        ];

        $scope.addDeleteFunctions = function () {
            $timeout(function () {
                var btns = $('table').find('td').find('button');
                $(btns).off('click');
                $(btns).on('click', function () {
                    var userId = this.id.split('_')[1];
                    $scope.deleteData('user', userId, function () {
                        $scope.page.message = {
                            type: 'success',
                            title: 'Deleted!',
                            text: ('User with id ' + userId + ' was successfully deleted!')
                        };
                        $('#messageModal').modal('show');
                    });
                });
            }, 300);
        };

        $scope.$watch("ctrl.filters.username", $scope.addDeleteFunctions);
        $scope.$watch("ctrl.filters.email", $scope.addDeleteFunctions);
        $scope.$watch("ctrl.filters.roleID", $scope.addDeleteFunctions);

        $scope.reloadTableData = function () {
            var resetPaging = false;
            $scope.dtInstance.reloadData(function (list) {
                //console.log(list);
                $scope.addDeleteFunctions();
            }, resetPaging);
        };
    }
    else {
        $scope.getAllRoles(function (data) {
            $scope.rolesList = data;

            if ($stateParams && $stateParams.id) {
                $scope.isEdit = true;
                $scope.getSingleData("user", $stateParams.id, function (data) {
                    $scope.user = data;
                });
            }
            else {
                $scope.isEdit = false;
                $scope.user = {
                    userRole: $scope.rolesList[0]
                };
            }
        });

        $scope.submit = function (user) {
            if ($scope.userForm.$valid) {
                $scope.master = angular.copy(user);
                $scope.master.regDate = (new Date()).toISOString();
                //$scope.master.lastLogin = (new Date()).toISOString();

                $scope.saveData("user", $scope.master, function () {
                    $scope.page.message = {
                        type: 'success',
                        title: 'Success!'
                    };

                    if ($scope.isEdit) {
                        $scope.page.message.text = ('Edited: ' + $scope.master.username);
                    } else {
                        $scope.page.message.text = ('Created: ' + $scope.master.username);
                    }

                    $('#messageModal').modal('show');
                    $location.path("/users/list");
                }, undefined, $scope.isEdit);
            }
        };
    }

    angular.element(document).ready(function () {
        if ($location.path().includes("list")) {
            $scope.reloadTableData();

            $('.delete-btn').click(function () {
                var id = this.id.split('_');
                banUser(id[1]);
            });
            //$interval($scope.reloadTableData, 30000);
        }
        else {

        }
    });

});