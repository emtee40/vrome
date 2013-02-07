String::startsWith = (str) ->
  !!@match("^#{str.escapeRegExp}")

String::endsWith = (str) ->
  @match(str + "$") is str

String::escapeRegExp = ->
  # From MooTools core 1.2.4
  @replace /([-.*+?^${}()|[\]\/\\])/g, "\\$1"

String::reverse = ->
  @split("").reverse().join ""

String::isUpperCase = ->
  this is @toUpperCase()

String::isLowerCase = ->
  this is @toLowerCase()

String::formatLineBreaks = ->
  @replace /\n/g, "<br/>"

String::isValidURL = ->
  exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/g
  @match(exp) isnt null

String::transformURL = ->
  exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/g
  @replace exp, "<a href='$1'>$1</a>"

String::trim = ->
  @replace(/^[\s\xA0]+/, "").replace /[\s\xA0]+$/, ""

String::trimFirst = (str) -> # String || Array
  if typeof str is "string"
    @replace(new RegExp("^#{str.escapeRegExp}")).trim()
  else
    result = this
    result = result.replace(new RegExp("^#{s.escapeRegExp}")).trim() for s in str
    result

String::reverse = ->
  @split("").reverse().join ""

String::isUpperCase = ->
  this is @toUpperCase()

String::isLowerCase = ->
  this is @toLowerCase()

String::firstLetterUpper = ->
  @charAt(0).toUpperCase() + @substring(1)

String::escape = ->
  $("<div>").text(this).html()

String::formatLong = (max, className) ->
  result = this.substring(0, max).escape
  if this.length > max
    a = $("<a class='#{className}'>")
    a.attr "href", "javascript:void(0);"
    a.attr "onclick", "var tmp = this.title;this.title = this.innerHTML;this.innerHTML = tmp;"
    a.attr "title", this
    a.html "&nbsp;...[more]"
    result += a.outerHTML
  result
