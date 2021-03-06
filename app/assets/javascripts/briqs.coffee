# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.directUpload').find('input:file').each (i, elem) ->
    fileInput = $(elem)
    form = $(fileInput.parents('form:first'))
    submitButton = form.find('input[type="submit"]')
    progressBar = $('<div class=\'bar\'></div>')
    barContainer = $('<div class=\'progress\'></div>').append(progressBar)
    fileInput.after barContainer
    fileInput.fileupload
      fileInput: fileInput
      url: form.data('url')
      type: 'POST'
      autoUpload: true
      formData: form.data('form-data')
      paramName: 'file'
      dataType: 'XML'
      replaceFileInput: false
      progressall: (e, data) ->
        progress = parseInt(data.loaded / data.total * 100, 10)
        progressBar.css 'width', progress + '%'
        return
      start: (e) ->
        submitButton.prop 'disabled', true
        progressBar.css('background', 'green').css('display', 'block').css('width', '0%').text 'Loading...'
        return
      done: (e, data) ->
        submitButton.prop 'disabled', false
        progressBar.text 'Uploading done'
        # extract key and generate URL from response
        key = $(data.jqXHR.responseXML).find('Key').text()
        url = window.location.protocol + '//' + form.data('host') + '/' + key
        $.ajax(
          url: form.data('callback-url')
          type: "POST"
          dataType: "JSON"
          data: { fileUrl: url }
          statusCode: {
            200: (response) ->
              window.location.href = response.redirect_url
            422: (response) ->

            404: (response) ->

          }
        )
        # create hidden field
        input = $('<input />',
          type: 'hidden'
          name: fileInput.attr('name')
          value: url)
        form.append input
        return
      fail: (e, data) ->
        submitButton.prop 'disabled', false
        progressBar.css('background', 'red').text 'Failed'
        return
    return
  return
