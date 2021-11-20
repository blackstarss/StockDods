$(document).on 'turbolinks:load', ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      placeholder:"記事はこちらに記入してください！"
      height: 500