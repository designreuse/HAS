app.controller("calendarCtrl", function ($scope, $filter, $http) {
    var ctrl = this;
    $scope.page.title = "Calendar";

    $scope.roomTypes = sampleRoomTypes;
    $scope.roomTypes[3] = "All";

    $scope.events = {
        list: [],
        selected: [],
        new: {},
        resources: []
    };

    ctrl.selectedRoomType = 3;
    $scope.guests = {
        list: [],
        selectedGuest: {}
    };
    $scope.isNewGuest = true;
    $scope.isAdditionalGuest = false;
    $scope.isExistingGroup = false;
    $scope.reservationGuest = {
        reservation: {},
        guest: {},
        room: {}
    };
    $scope.newReservationGuest = {
        reservation: {},
        guest: {},
        room: {}
    };
    $scope.groupReservationsList = [];
    $scope.reservationInfo = {};
    $scope.timer;

    $scope.getRoom = function (roomId, callback) {
        $http({
            method: "GET",
            url: ("room/" + roomId),
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
                loadEvents();
            }).then(callback);
    };

    $scope.getRooms = function (callback) {
        $http({
            method: "GET",
            url: "rooms",
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
            })
            .then(callback);
    };

    $scope.getAllGuests = function (updateCallback) {
        $http({
            method: "GET",
            url: "guests",
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
            }).then(updateCallback);
    };

    $scope.getEmployeeByUserId = function (userID, updateCallback) {
        $http({
            method: "GET",
            url: ("employee/by-user/" + userID),
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
            }).then(updateCallback);
    };

    $scope.saveReservation = function () {
        function afterEventCreated(data) {
            $scope.scheduler.message("New event created!");

            console.log("New reservation: ", data);

            $scope.resetReservation();
            $scope.getAllGuests(function (data) {
                $scope.guests.list = data;
            });
        };

        if ($scope.isNewGuest) { // create new guest
            $scope.reservationGuest.guest.numberReservations = 0;
            $scope.reservationGuest.guest.status = 0;

            $scope.saveData("guest", $scope.reservationGuest.guest, function (data) {
                $scope.reservationGuest.guest = data;
                $scope.saveData("reservation-guest", $scope.reservationGuest, afterEventCreated, $scope.resetReservation);
            }, $scope.resetReservation);
        }
        else { // use existing guest
            $scope.reservationGuest.guest = $scope.guests.selectedGuest;
            $scope.reservationGuest.guest.numberReservations += 1;

            $scope.saveData("reservation-guest", $scope.reservationGuest, afterEventCreated, $scope.resetReservation);
        }
    };

    $scope.closeReservation = function (id, callback) {
        $http({
            method: "PUT",
            url: ("reservation/close/" + id),
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
                $scope.resetReservation();
            })
            .then(callback);
    };

    $scope.getGroupReservations = function () {
        var searchFilters = {
            startDate: $scope.config.startDate,
            endDate: moment($scope.config.startDate).add($scope.config.days, 'days').format("YYYY-MM-DD"),
            group: true
        };

        $http({
            method: "POST",
            url: "reservations/search",
            responseType: "json",
            headers: {
                "Authorization": $scope.authentication
            },
            data: searchFilters
        })
            .then(
                function (response) {
                    $scope.groupReservationsList = response.data;
                },
                function (response) {
                    $scope.displayMessage(response.data);
                }
            );
    };

    $scope.startDate = new DayPilot.Date(new Date());
    $scope.endDate = $scope.startDate.addDays(21);
    $scope.startDate = $scope.startDate.addDays(-3);

    $scope.config = {
        scale: "Day",
        startDate: $scope.startDate,
        days: 14,
        //scale: "Manual",
        //timeline: getTimeline(),
        resources: $scope.events.resources,
        timeHeaders: [{groupBy: "Month"}, {groupBy: "Day", format: "d"}],
        eventDeleteHandling: "Update",
        eventClickHandling: "Select",
        allowEventOverlap: false,
        cellWidthSpec: "Auto",
        eventHeight: 50,
        rowHeaderColumns: [
            {title: "Room"},
            {title: "Capacity", width: 80},
            {title: "Status", width: 80}
        ],
        contextMenu: new DayPilot.Menu({
            items: [
                {
                    text: '<i class="fa fa-info"></i> Show reservation info',
                    onclick: function () {
                        var tmp = this.source.data.objReservation;
                        $scope.$apply(function () {
                            $scope.reservationInfo = tmp;
                            $scope.reservationInfo.startDate = new Date($scope.reservationInfo.startDate).toLocaleDateString();
                            $scope.reservationInfo.endDate = new Date($scope.reservationInfo.endDate).toLocaleDateString();
                            $('#infoModal').modal('show');
                        });

                    }
                },
                {
                    text: '<i class="fa fa-plus"></i> Add another guest',
                    onclick: function () {
                        $scope.reservationGuest = this.source.data.objReservation.reservationGuests[0];
                        var tmpReservation = this.source.data.objReservation;

                        var nGuests = tmpReservation.reservationGuests.length;

                        delete tmpReservation.reservationGuests;

                        var selectedRoom = $scope.events.resources[this.source.resource() - 1];
                        var roomCapacity = (selectedRoom.bedsDouble * 2) + selectedRoom.bedsSingle;

                        if (nGuests >= roomCapacity) {
                            $scope.page.message = {
                                type: 'danger',
                                title: "Can't add guest!",
                                text: "This room has reached its guest capacity!"
                            };
                            $('#messageModal').modal('show');

                            $scope.resetReservation();
                            return;
                        }

                        $scope.reservationGuest.guest = {};
                        $scope.reservationGuest.reservation = tmpReservation;
                        $scope.reservationGuest.room = selectedRoom;
                        $scope.reservationGuest.id = null;
                        $scope.reservationGuest.owner = false;

                        $scope.isAdditionalGuest = true;
                        $scope.$apply();

                        $('#reservationModal').modal('show');
                    }
                },
                {
                    text: '<i class="fa fa-play"></i> Start reservation',
                    onclick: function () {
                        if (this.source.data.objReservation.status > 0
                            || this.source.data.objReservation.startDate != moment().format("YYYY-MM-DD"))
                            return;

                        if (confirm("Start reservation?\n" + "Start: " + this.source.start() + "\nEnd:" + this.source.end())) {
                            var tmp = this.source.data.objReservation;
                            tmp.status = 1;
                            $scope.saveData('reservation', tmp, function () {
                                $scope.scheduler.message("Reservation started: " + tmp.reservationGuests[0].guest.personalData.fullName);
                                loadEvents();
                            }, $scope.resetReservation, true);
                        } else {
                            loadEvents();
                        }
                    }
                },
                {
                    text: '<i class="fa fa-trash-o"></i> Delete reservation',
                    onclick: function () {
                        if (confirm("Delete reservation?\n" + "Start: " + this.source.start() + "\nEnd:" + this.source.end())) {
                            $scope.scheduler.events.remove(this.source);

                            $scope.deleteData("reservation", this.source.data.objReservation.id, function (data) {
                                $scope.scheduler.message("Reservation deleted: " + data.reservationGuests[0].guest.personalData.fullName);
                                $scope.resetReservation();
                            });
                        } else {
                            loadEvents();
                        }
                    }
                },
                {
                    text: '<i class="fa fa-times"></i> Close reservation',
                    onclick: function () {
                        if (confirm("Close reservation?\n" + "Start: " + this.source.start() + "\nEnd:" + this.source.end())) {
                            //$scope.scheduler.events.remove(this.source);

                            $scope.closeReservation(this.source.data.objReservation.id, function (data) {
                                $scope.scheduler.message("Reservation closed: " + data.reservationGuests[0].guest.personalData.fullName);
                                $scope.resetReservation();
                            });
                        } else {
                            loadEvents();
                        }
                    }
                }
            ]
        }),
        onBeforeCellRender: function (args) {
            if (args.cell.start <= DayPilot.Date.today() && DayPilot.Date.today() < args.cell.end) {
                args.cell.backColor = "#fff0b3";
            }
        },
        onBeforeResHeaderRender: function (args) {
            var beds = function (single, double) {
                return (single + " single, " + double + " double");
            };

            args.resource.name = args.resource.number;

            args.resource.columns[0].html = beds(args.resource.bedsSingle, args.resource.bedsDouble);
            args.resource.columns[1].html = $scope.roomStatuses[args.resource.status];
            switch (args.resource.status) {
                case 1:
                    args.resource.cssClass = "status_dirty";
                    break;
                case 2:
                    args.resource.cssClass = "status_cleanup";
                    break;
            }
        },
        onEventSelected: function (args) {
            $scope.$apply(function () {
                $scope.events.selected = $scope.scheduler.multiselect.events();
            });
        },
        onEventMoved: function (args) {
            $scope.scheduler.clearSelection();

            if (!confirm("Are you sure you want to move the reservation?")) {
                loadEvents();
                return;
            }

            var tmpReservatoin = args.e.data.objReservation;
            tmpReservatoin.startDate = args.newStart.value.substr(0, 10);
            tmpReservatoin.endDate = args.newEnd.value.substr(0, 10);

            $scope.getRoom(args.newResource, function (room) {
                if (!tmpReservatoin.group) {
                    angular.forEach(tmpReservatoin.reservationGuests, function (value, key) {
                        value.room = room;
                    });
                } else {
                    var oldRoomId = args.e.data.roomId;

                    angular.forEach(tmpReservatoin.reservationGuests, function (resGuest, key) {
                        if (resGuest.room.id == oldRoomId) {
                            resGuest.room = room;
                        }
                    });

                    args.e.data.roomId = room.id;
                }

                $scope.saveData("reservation", tmpReservatoin, function (data) {
                    $scope.scheduler.message("Reservation moved: " + args.e.text());
                    $scope.resetReservation();
                }, $scope.resetReservation, true);

            });
        },
        onEventResized: function (args) {
            $scope.scheduler.clearSelection();

            if (!confirm("Are you sure you want to resize the reservation?")) {
                loadEvents();
                return;
            }

            var tmpReservatoin = args.e.data.objReservation;
            tmpReservatoin.startDate = args.newStart.value.substr(0, 10);
            tmpReservatoin.endDate = args.newEnd.value.substr(0, 10);

            $http({
                method: "PUT",
                url: ("reservation/move/" + tmpReservatoin.id),
                responseType: "json",
                headers: {
                    "Authorization": $scope.authentication
                },
                data: tmpReservatoin
            }).then(
                function (response) { //success
                    response.data;
                },
                function (response) { //error
                    $scope.displayMessage(response.data);
                    $scope.resetReservation();
                })
                .then(function (data) {
                    $scope.scheduler.message("Reservation duration resized: " + args.e.text());
                    $scope.resetReservation();
                });
        },
        onEventDeleted: function (args) {
            $scope.scheduler.clearSelection();

            if (confirm("Delete reservation?\n" + "Start: " + args.e.start() + "\nEnd:" + args.e.end())) {
                $scope.scheduler.events.remove(args.e);

                $scope.deleteData("reservation", args.e.data.objReservation.id, function (data) {
                    $scope.scheduler.message("Reservation deleted: " + args.e.text());
                    $scope.resetReservation();
                });
            } else {
                loadEvents();
            }


        },
        onTimeRangeSelected: function (args) {
            $scope.scheduler.clearSelection();
            //clearInterval($scope.timer);
            //loadEvents();

            if (!$scope.events.new.start) {
                $scope.$apply(function () {
                    $scope.events.new = {
                        start: args.start,
                        end: args.end,
                        resource: args.resource
                    };
                });

                $scope.getGroupReservations();

                $('#reservationModal').modal('show');
            }
        },
        onEventClick: function (args) {

        },
        onBeforeEventRender: function (args) {
            var start = new DayPilot.Date(args.data.start);
            var end = new DayPilot.Date(args.data.end);

            args.data.start = start.addHours(12);
            args.data.end = end.addHours(12);

            var now = new DayPilot.Date();
            var today = new DayPilot.Date().getDatePart();
            var status = "";

            // customize the reservation bar color and tooltip depending on status
            switch (args.e.status) {
                case 0:
                    var checkinDeadline = today.addHours(21);
                    if ((start < today) || (start === today && now > checkinDeadline)) { // must checkoin before 21:00
                        args.data.barColor = "#e55";  // red
                        status = "Late Arrival";
                    } else {
                        args.data.barColor = "#feda55";  // orange
                        status = "New"
                    }
                    break;
                case 1: // arrived
                    var checkoutDeadline = today.addHours(12);

                    if ((end < today) || (end === today && now > checkoutDeadline)) { // must checkout before 10:00
                        args.data.barColor = "#e55";  // red
                        status = "Late checkout";
                    }
                    else {
                        args.data.barColor = "#1691f4";  // blue
                        status = "Arrived";
                    }
                    break;
                case 2: // checked out
                    args.data.barColor = "red";
                    status = "Checked out";
                    break;
                default:
                    status = "Unexpected state";
                    break;
            }

            // customize the reservation HTML: text, start and end dates
            args.data.html = args.data.text + " (" + start.toString("d/M/yyyy") + " - " + end.toString("d/M/yyyy") + ")" + "<br /><span style='color:gray'>" + status + "</span>";

            // reservation tooltip that appears on hover - displays the status text
            args.e.toolTip = status;
        },
        onEventFilter: function (args) {
            var filteredRes = $filter('filter')($scope.events.resources, {type: args.filter});
            var found = false;

            angular.forEach(filteredRes, function (value, key) {
                var tmp = args.e.resource();
                if (value.id == tmp) {
                    found = true;
                    return;
                }
            });
            args.visible = found;
        }
    };

    function getTimeline(date, days) {
        var initDate = date || DayPilot.Date.today();
        var start = new DayPilot.Date(initDate);
        var period = days || 14;

        var timeline = [];

        var checkin = 12;
        var checkout = 12;

        for (var i = 0; i < period; i++) {
            var day = start.addDays(i);
            timeline.push({start: day.addHours(checkin), end: day.addDays(1).addHours(checkout)});
        }

        return timeline;
    }

    function loadEvents() {
        var range = {
            startDate: $scope.config.startDate,
            endDate: moment($scope.config.startDate).add($scope.config.days, 'days').format("YYYY-MM-DD")
        };

        $http({
            method: "POST",
            url: "reservations/search",
            responseType: "json",
            headers: {
                "Authorization": $scope.authentication
            },
            data: range
        }).then(
            function (response) { //success
                $scope.events.list = [];

                angular.forEach(response.data, function (reservation, key) {
                    var tmpEvent = {
                        start: reservation.startDate,
                        end: reservation.endDate,
                        //id: reservation.id,
                        //resource: reservation.reservationGuests[0].room.id,
                        status: reservation.status,
                        text: reservation.reservationGuests[0].guest.personalData.fullName,
                        objReservation: reservation
                    };

                    if (!reservation.group) {
                        tmpEvent.id = reservation.id;
                        tmpEvent.resource = reservation.reservationGuests[0].room.id;
                        $scope.events.list.push(tmpEvent);
                    } else {
                        var resRooms = [];
                        angular.forEach(reservation.reservationGuests, function (resGuest, index) {
                            if (resRooms.indexOf(resGuest.room.id) == -1) {
                                resRooms.push(resGuest.room.id);

                                var tmpEvent2 = angular.extend(
                                    {},
                                    tmpEvent,
                                    {
                                        id: (key + '_' + (index + 1)),
                                        resource: resGuest.room.id,
                                        roomId: resGuest.room.id
                                    }
                                );

                                $scope.events.list.push(tmpEvent2);
                            }
                        });
                    }
                    ;
                });
            },
            function (response) { //error
                $scope.displayMessage(response.data);
            });
    }

    $scope.changeRoomType = function () {
        $scope.getRooms(function (data) {
            $scope.events.resources = data;

            if (ctrl.selectedRoomType == 3) {
                $scope.config.resources = $scope.events.resources;
            } else {
                var filtered = $filter('filter')($scope.events.resources, {roomClass: ctrl.selectedRoomType});
                $scope.config.resources = filtered;
            }
        });
    };

    $scope.submit = function () {
        if ($scope.isAdditionalGuest)
            $scope.addGuest();
        else
            $scope.addReservation();
    };

    $scope.reset = function () {
        if ($scope.isAdditionalGuest)
            $scope.resetGuest();
        else
            $scope.resetReservation();
    };

    $scope.addReservation = function () {

        $scope.getEmployeeByUserId($scope.loginData.id, function (data) {
            $scope.reservationGuest.room = $scope.events.resources[$scope.events.new.resource - 1];
            $scope.reservationGuest.owner = true;

            var objReservation = {};

            if ($scope.isExistingGroup && $scope.reservationGuest.reservation.id) {
                objReservation = $scope.reservationGuest.reservation;
                $scope.reservationGuest.owner = false;
                $scope.saveReservation();

                $('#reservationModal').modal('hide');
                return;
            } else {
                objReservation = {
                    startDate: $scope.events.new.start.value.substr(0, 10),
                    endDate: $scope.events.new.end.value.substr(0, 10),
                    breakfast: $scope.reservationGuest.reservation.breakfast,
                    dinner: $scope.reservationGuest.reservation.dinner,
                    allInclusive: $scope.reservationGuest.reservation.allInclusive,
                    price: 40.0,
                    discount: 0,
                    numberAdults: 1,
                    numberChildren: 0,
                    status: 0,
                    group: $scope.reservationGuest.reservation.group,
                    receptionist: data
                };
            }

            $scope.saveData("reservation", objReservation, function (newReservation) {
                $scope.reservationGuest.reservation = newReservation;
                $scope.saveReservation();
            }, $scope.resetReservation);

            $('#reservationModal').modal('hide');
        });

    };

    $scope.resetReservation = function () {
        $scope.events.new = {};
        $scope.events.selected = [];
        $scope.guests.selectedGuest = {};
        $scope.reservationGuest = {
            reservation: {},
            guest: {},
            room: {}
        };

        loadEvents();
    };

    $scope.addGuest = function () {
        if ($scope.isNewGuest) {
            $scope.reservationGuest.guest.numberReservations = 0;
            $scope.reservationGuest.guest.status = 0;

            $scope.saveData("guest", $scope.reservationGuest.guest, function (data) {
                $scope.reservationGuest.guest = data;
                $scope.reservationGuest.reservation.lastModifiedBy = $scope.loginData;
                $scope.reservationGuest.reservation.lastModifiedTime = new Date().toISOString();

                $scope.saveData("reservation-guest", $scope.reservationGuest, function (data) {
                    $scope.scheduler.message("Added new guest: " + $scope.reservationGuest.guest.personalData.fullName);

                    $scope.resetGuest();
                    loadEvents();
                    $scope.getAllGuests(function (data) {
                        $scope.guests.list = data;
                    });
                }, $scope.resetGuest);
            }, $scope.resetGuest);
        } else {
            $scope.reservationGuest.guest = $scope.guests.selectedGuest;
            $scope.reservationGuest.reservation.lastModifiedBy = $scope.loginData;
            $scope.reservationGuest.reservation.lastModifiedTime = new Date().toISOString();

            $scope.saveData("reservation-guest", $scope.reservationGuest, function (data) {
                $scope.scheduler.message("Added new guest to reservation!");

                $scope.resetGuest();
                loadEvents();

                $scope.getAllGuests(function (data) {
                    $scope.guests.list = data;
                });
            }, $scope.resetGuest);
        }

        $('#reservationModal').modal('hide');
    };
    $scope.resetGuest = function () {
        $scope.reservationGuest = {
            reservation: {},
            guest: {},
            room: {}
        };
        $scope.isAdditionalGuest = false;
    };

    $scope.scrollTo = function (date) {
        $scope.scheduler.scrollTo(date);
    };

    $scope.setScale = function (val) {
        $scope.config.scale = val;
        if (val == "Day") {
            $scope.config.days = 14;
        }
    };

    function addDays(date, days) {
        var result = new Date(date);
        result.setDate(result.getDate() + days);
        return result;
    }

    function setDateRange(start, end, label) {
        $scope.$apply(function () {
            var tmp = end._d.getTime() - start._d.getTime();
            //$scope.config.timeline = getTimeline(start._d, tmp / 86400000);
            $scope.config.startDate = start._d.toISOString().substr(0, 10);
            $scope.config.days = tmp / 86400000;

            loadEvents();
        });

    }

    angular.element(document).ready(function () {
        $scope.changeRoomType();

        loadEvents();

        //$scope.timer = setInterval(loadEvents, 10000);

        $scope.getAllGuests(function (data) {
            $scope.guests.list = data;
        });

        $('#dateRange').daterangepicker({
            parentEl: "#scheduleContainer",
            startDate: $scope.startDate,
            endDate: $scope.endDate,
            locale: {
                format: "DD/MM/YY"
            }
        }, setDateRange);

        $('.calendar').css({float: 'left'});

        //$('#selectGuest').select2();
    });
});