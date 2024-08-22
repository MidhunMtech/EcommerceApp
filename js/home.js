$(document).ready(function () {
    $('.dropdown-submenu a.dropdown-toggle').on("click", function (e) {
      e.preventDefault();
      e.stopPropagation();
      $(this).next('.dropdown-menu').toggle();
    });

    $('.dropdown').on("hide.bs.dropdown", function () {
      $('.dropdown-menu').hide();
    });
});