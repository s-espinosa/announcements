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
  window.setTimeout(function() {
    if (currentSlide < count) {
      $("#main-billboard").fadeOut(1500, function() {
        renderSlide(slides[currentSlide]);
        $("#main-billboard").fadeIn(1500, function() {
          renderSlides(slides, count, currentSlide + 1);
        })
      })
    } else {
      $("#main-billboard").fadeOut(1500, function() {
        pullSlides();
      })
    }
  }, 3000)
}

function renderSlide(slide){
  slideHTML = assemble(slide);
  var div = $("#main-billboard");
  div.html(slideHTML)
}

function assemble(slide) {
  var slideHTML = "<h1 class='billboard-title'>" + slide.title + "</h1>" +
    "<h2 class='billboard-message'>" + slide.message + "</h1>" +
    "<img src='" + slide.image_url + "' class='billboard-image'>";
  return slideHTML;
}
