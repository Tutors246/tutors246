function priceToggle(e) {
  e.preventDefault();
  $(this).parent().next().toggleClass('opened');
}

$('.price-block__trigger').on('click', priceToggle);
$('.price-block__trigger').on('touchstart', priceToggle);