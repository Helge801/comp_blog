jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  if $('#comments').length > 0
    comments_to_bottom = -> comments.scrollTop(comments.prop("scrollHeight"))

    comments_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "BlogsChannel"
        blog_id: comments.data('blog-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        console.log("received")
        comments.append data['comment']
        comments_to_bottom()

      send_comment: (comment, blog_id) ->
        @perform 'send_comment', comment: comment, blog_id: blog_id


    $('#new_comment').submit (e) ->
      $this = $(this)
      textarea = $this.find('#comment_body')
      if $.trim(textarea.val()).length > 1
        App.global_chat.send_comment textarea.val(), comments.data('blog-id')
        textarea.val('')
      e.preventDefault()
      return false