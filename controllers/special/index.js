'use strict';


var SpecialModel = require('../../models/special');


module.exports = function (router) {

    var model = new SpecialModel();


    router.get('/', function (req, res) {
        res.render('bookings/booking', model)
    });

    router.get('/add', function (req, res) {
        res.render('specials/special-add', model)
    });
};
