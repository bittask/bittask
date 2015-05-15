jQuery ->

  $(document).on 'click', '#submit_task_form', ->
    $(this).parents('form').submit()