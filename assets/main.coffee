require.config(
  baseUrl: "assets/js/"
  paths:
    jquery: "lib/jquery"
    underscore: "lib/underscore"
    backbone: "lib/backbone"
    hbs: "lib/hbs"
    json2: "lib/json2"
    text: "lib/text"
  shim:
    underscore:
      exports: "_"
    backbone:
      deps: [ "underscore", "jquery" ]
      exports: "Backbone"
)

require(["jquery", "underscore", "backbone", "text!../../template/empresa.html"], ($, _, Backbone, tmplEmpresa) ->

  class Empresa extends Backbone.Model
    defaults:
      name: "Empresa"
      phone: "00 0000 0000"

  class Empresas extends Backbone.Collection
    model: Empresa

  class EmpresaView extends Backbone.View
    el: $("#companies")
    template: _.template tmplEmpresa

    initialize: ->
      @render()

    render: ->
      data = {name: "Teste", phone: "62 81317530"}
      @$el.html @template data

  window.empresas = new EmpresaView()

)