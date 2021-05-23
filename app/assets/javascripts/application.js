// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require jquery_ujs
//= require_self

/*global $ */
function subscribe() {
        var email = $('#subscribeEmail').val();
        var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if ((email !== "") && email.match(emailRegex)) {
            $.ajax({
                url: '/newsletter/subscribe',
                type: 'GET',
                dataType: 'json',
                data: {
                    'email' : email
                },
                success: function(res) {
                    alert("Successfully subscribed");
                }
            });
        }
        
        else{
            alert("Invalid email address.")
        }
    }

  