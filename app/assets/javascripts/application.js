// ---------------------- Gems ----------------------- //
// require jquery_ujs
//= require rails-ujs
//= require jquery-ui
//= require jquery.remotipart
//= require cocoon
//= require isInViewport
//= require turbolinks
//= require paloma
//= require jquery.atwho
//= require social-share-button
//= require codemirror
//= require activestorage
//= require cookies_eu
//= require rails.validations
//= require local-time
//= require lodash

// --------------------- Vendor ------------------------ //
//= require jQuery-File-Upload
//= require remodal

// ------------------ Vendor / Notebooks --------------- //
// require ansi_up.min
// require es5-shim.min
// require marked.min
// require notebook.min
//= require prism.min

// ---------------------- Modules ---------------------- //
//= require modules/site
//= require modules/subnav_tabs
//= require modules/inline_validations
//= require modules/rangy_inputs
//= require modules/markdown_editor
//= require modules/flash_messages
//= require modules/direct_s3_upload
//= require modules/mentions

// ---------------------- Pages ---------------------- //
// require pages/participants_edit
// require pages/email_preferences_edit

// -------------------- Controllers ------------------- //
//= require controllers/articles_controller
//= require controllers/challenges_controller
//= require controllers/leaderboards_controller
//= require controllers/dataset_files_controller
//= require controllers/task_dataset_files_controller
//= require controllers/participants_controller
// require controllers/email_preferences_controller


// ------------------------ STARTUP -------------------------- //

document.addEventListener("turbolinks:load", function() {
  $('[data-remodal-id=modal]').remodal();
});

document.addEventListener("turbolinks:load", function() {
  Paloma.start();
});

function loadMathJax() {
  window.MathJax = null;
  $.getScript("https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML", function() {
    MathJax.Hub.Config({
      tex2jax: {
            inlineMath: [ ["$","$"],["\\(","\\)"] ],
            displayMath: [ ['$$','$$'], ["\\[","\\]"] ],
            processEscapes: true
      }
    });
  });
};

$(document).on('turbolinks:load', function() {
  loadMathJax();
});

// Remove default Turbolinks loader
Turbolinks.ProgressBar.prototype.refresh = function() {}
Turbolinks.ProgressBar.defaultCSS = ""
var loaderTimer;

document.addEventListener("turbolinks:click", function() {
  loaderTimer = setTimeout(function(){
    $('#page-content').hide();
    $('#loader-container').show();
  }, 250);
});

document.addEventListener("turbolinks:load", function() {
  clearTimeout(loaderTimer);
  $('#page-content').show();
  $('#loader-container').hide();
});

$(document).on('turbolinks:load', function() {
  loadMathJax();
});

$(document).on('turbolinks:load', function() {
  window.setTimeout(function () {
    $(".alert").alert('close')
  }, 5000);
});
