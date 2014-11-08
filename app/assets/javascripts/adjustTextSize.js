  var fontMetrics = document.getElementById('font-metrics');
  var scaleTexts  = $('.scale-text');

  $(window).on('resize', updateFontSize);
  updateFontSize();

  function updateFontSize()
  {
      scaleTexts.each(function()
      {
          var $scaleText = $$(this);

          fontMetrics.innerHTML = this.innerHTML;
          fontMetrics.style.fontFamily = $scaleText.css('font-family');
          fontMetrics.style.fontWeight = $scaleText.css('font-weight');
          fontMetrics.style.fontStyle = $scaleText.css('font-style');
          fontMetrics.style.textTransform = $scaleText.css('text-transform');

          var fontSize = 150; // max font-size to test
          fontMetrics.style.fontSize = fontSize + 'px';

          while ($$(fontMetrics).width() > $scaleText.width() && fontSize >= 0)
          {
              fontSize -= 1;
              fontMetrics.style.fontSize = fontSize + 'px';
          }

          this.style.fontSize = fontSize + 'px';
      });
  }

  /**
   * A simple caching function for jQuery objects.
   */
  function $$(object)
  {
      if (!object.jquery)
          object.jquery = $(object);

      return object.jquery;
  }