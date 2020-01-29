require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

import "bootstrap";

import "controllers"


$(document).ready(function() {
  $('pre code').each(function(i, block) {
    hljs.highlightBlock(block);
  });
});
