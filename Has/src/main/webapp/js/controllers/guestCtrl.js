app.controller("guestCtrl", function ($scope, $state, $stateParams, $interval, $resource, $http, DTOptionsBuilder, DTColumnBuilder) {
    var ctrl = this;
    $scope.page.title = "Guests";
    $scope.master = {};
    ctrl.filters = {
        fullName: "",
        phone: ""
    };
    $scope.usersList = [];
    $scope.isEdit = false;

    if (window.location.hash.includes("list")) {
        // guests table
        $scope.dtInstance = {};

        $scope.dtOptions = DTOptionsBuilder.newOptions()
            .withOption('ajax', {
                url: 'guests/search',
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
            DTColumnBuilder.newColumn('personalData.fullName', 'Full Name'),
            DTColumnBuilder.newColumn('personalData.phone', 'Phone Number'),
            DTColumnBuilder.newColumn('personalData.address', 'Address'),
            DTColumnBuilder.newColumn('numberReservations', 'Number of Reservations'),
            DTColumnBuilder.newColumn('id').notSortable().withClass('actions-column')
                .renderWith(function (id) {
                    var html =
                        '<div class="btn-group btn-group-sm">' +
                        '<a class="btn btn-default action-btn" href="#!/guests/edit/' +
                        id + '"><i class="fa fa-pencil" aria-hidden="true"></i></a>' +
                        '<a class="btn btn-default action-btn delete-btn" id="ban_' +
                        id + '" href="javascript:;"><i class="fa fa-trash-o" aria-hidden="true"></i></a>' +
                        '</div>';
                    return html;
                })
        ];
        $scope.reloadTableData = function () {
            var resetPaging = false;
            $scope.dtInstance.reloadData(function (list) {
                console.log(list);
            }, resetPaging);
        };
    }
    else {
        function saveGuest(callback) {
            var url = $scope.isEdit ? ("guest/" + $stateParams.id) : "guest";
            var method = $scope.isEdit ? "PUT" : "POST";

            $http({
                method: method,
                url: url,
                data: $scope.master,
                responseType: "json",
                headers: {
                    "Authorization": $scope.authentication
                }
            }).then(
                callback,
                function (response) { //error
                    $scope.displayMessage(response.data);
                });
        }

        $scope.getAllUsers(function (data) {
            $scope.usersList = data;
            $scope.usersList[data.length] = {
                id: 0,
                username: "-- None --"
            };

            if ($stateParams && $stateParams.id) {
                $scope.isEdit = true;

                var url = "guest/" + $stateParams.id;

                $http({
                    method: "GET",
                    url: url,
                    responseType: "json",
                    headers: {
                        "Authorization": $scope.authentication
                    }
                }).then(
                    function (response) { //success
                        return response.data;
                    },
                    function (response) { //error
                        $scope.displayMessage(response.data);
                    }).then(
                    function (data) {
                        $scope.guest = data;
                    });
            }
            else {
                $scope.isEdit = false;
                $scope.guest = {
                    numberReservations: 0,
                    status: 0,
                    personalData: {}
                };
            }
        });

        $scope.submit = function (guest) {
            if ($scope.guestForm.$valid) {
                $scope.master = angular.copy(guest);

                if ($scope.master.user.id === 0)
                    delete $scope.master.user;

                saveGuest(function () {
                    if ($scope.isEdit) {
                        alert('Edited: ' + $scope.master.personalData.fullName);
                    } else {
                        alert('Created: ' + $scope.master.personalData.fullName);
                    }
                    window.location.hash = "#!/guests/list";
                });
            }
        };
    }

    angular.element(document).ready(function () {

        if (window.location.hash.includes("list")) {
            $scope.reloadTableData();
            //$interval($scope.reloadTableData, 30000);
        }
        else {
            $('#dateHired,#identityIssueDate,#identityExpireDate').daterangepicker({
                singleDatePicker: true,
                showDropdowns: true,
                locale: {
                    format: "YYYY-MM-DD"
                }
            });
        }
    });

});