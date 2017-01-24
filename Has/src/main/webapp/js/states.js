var stateLogin = {
    url: "/login",
    views: {
        "login": {
            templateUrl: "templates/login.html",
            //controller: "mainCtrl"
        }
    },
    onEnter: function () {
        angular.element(document).ready(function () {
            $('body').removeClass('nav-md');
            $('body').addClass('login');
            $('#logged_content').hide();
            $('.login_wrapper').show();
        });
    },
    onExit: function () {
        angular.element(document).ready(function () {
            $('body').removeClass('login');
            $('body').addClass('nav-md');
            $('.login_wrapper').hide();
            $('#logged_content').show();
        });
    }
};

var stateMain = {
    url: "",
    abstract: true,
    views: {
        "loggedin": {
            templateUrl: "templates/main.html",
            //controller: "mainCtrl"
        }
    },
};

var stateRoot = {
    views: {
        "navigation": {
            templateUrl: 'templates/navigation.html'
        },
        "menu": {
            templateUrl: 'templates/menu.html'
        },
        'content': {
            template: 'DEFAULT VIEW'
        }
    },
    onEnter: function () {
        angular.element(document).ready(function () {
            CURRENT_URL = window.location.href.split('?')[0];
            $BODY = $('body');
            $MENU_TOGGLE = $('#menu_toggle');
            $SIDEBAR_MENU = $('#sidebar-menu');
            $SIDEBAR_FOOTER = $('.sidebar-footer');
            $LEFT_COL = $('.left_col');
            $RIGHT_COL = $('.right_col');
            $NAV_MENU = $('.nav_menu');
            $FOOTER = $('footer');

            initializeSidebar();
        });
    }
};

var stateHome = {
    url: '/home',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/home.html',
            //controller: "mainCtrl"
        }
    }
};

var stateCalendar = {
    url: '/calendar',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/reception/calendar.html',
            controller: "calendarCtrl"
        }
    }
};


//---------------------USERS----------------------//

var stateProfileView = {
    url: '/profile',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/profile.html',
            controller: "userCtrl"
        }
    }
};

var stateUserList = {
    url: '/users/list',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/users/list.html',
            controller: "userCtrl"
        }
    }
};

var stateUserAdd = {
    url: '/users/add',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/users/add.html',
            controller: "userCtrl"
        }
    }
};

var stateUserEdit = {
    url: '/users/edit/:id',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/users/add.html',
            controller: "userCtrl"
        }
    }
};

//------------------------------------------------//


//-------------------EMPLOYEES--------------------//
var stateEmployeeList = {
    url: '/employees/list',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/employees/list.html',
            controller: "employeeCtrl"
        }
    }
};

var stateEmployeeAdd = {
    url: '/employees/add',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/employees/add.html',
            controller: "employeeCtrl"
        }
    }
};

var stateEmployeeEdit = {
    url: '/employees/edit/:id',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/employees/add.html',
            controller: "employeeCtrl"
        }
    }
};

//------------------------------------------------//


//---------------------GUESTS---------------------//
var stateGuestList = {
    url: '/guests/list',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/guests/list.html',
            controller: "guestCtrl"
        }
    }
};

var stateGuestAdd = {
    url: '/guests/add',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/guests/add.html',
            controller: "guestCtrl"
        }
    }
};

var stateGuestEdit = {
    url: '/guests/edit/:id',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/guests/add.html',
            controller: "guestCtrl"
        }
    }
};

//------------------------------------------------//


//---------------------ROOMS----------------------//

var stateRoomList = {
    url: '/rooms/list',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/rooms/list.html',
            controller: "roomCtrl"
        }
    }
};

var stateRoomAdd = {
    url: '/rooms/add',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/rooms/add.html',
            controller: "roomCtrl"
        }
    }
};

var stateRoomEdit = {
    url: '/rooms/edit/:id',
    views: {
        'content@loggedin': {
            templateUrl: 'templates/rooms/add.html',
            controller: "roomCtrl"
        }
    }
};

//------------------------------------------------//