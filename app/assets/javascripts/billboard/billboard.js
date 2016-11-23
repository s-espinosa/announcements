$(document).ready(function() {
  if($("#main-billboard")){
    pullSlides();
  }
});

function pullSlides() {
  $.ajax({
    method: "GET",
    url: "/api/v1/slides",
    dataType: "JSON",
    success: renderContent
  });
}

function renderContent(slides){
  var count = slides.length;
  renderSlides(slides, count)
}

function renderSlides(slides, count, currentSlide) {
  if (currentSlide === undefined) {
    currentSlide = 0;
  }
  if (currentSlide < count) {
    window.setTimeout(function() {
      $("#main-billboard").fadeOut(1500, function() {
        renderSlide(slides[currentSlide]);
        $("#main-billboard").fadeIn(1500, function() {
          renderSlides(slides, count, currentSlide + 1);
        })
      })
    }, 3000)
  } else {
    pullSlides();
  }
}

function renderSlide(slide){
  slideHTML = assemble(slide);
  var div = $("#main-billboard");
  div.html(slideHTML)
}

function assemble(slide) {
  var slideHTML = "";
    if (slide.title != "") {
      slideHTML += "<h1 class='billboard-title'>" + slide.title + "</h1>" +
      "<h2 class='billboard-message'>" + slide.message + "</h2>";
    }
    slideHTML += "<img src='" + slide.image_url + "' class='billboard-image'>";
  return slideHTML;
}
