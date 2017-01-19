'use strict'

const imageZoom = () => {
  $('img').on('click', function(e) {
    let imgURL = $(this).prop('src')
    let imgAlt = $(this).prop('alt')
    const imgZoom =
      `<img alt=${imgAlt} class="img-zoomed" src=${imgURL}/>`

    $(imgZoom).appendTo($('body'))
    clearZoomedImage()
  })
}

const clearZoomedImage = () => {
  const $zoomedImage = $('img.img-zoomed')

  $zoomedImage.on('click', function() {
    $(this).remove()
  })
}


$(document).ready(() => {

  imageZoom()

})