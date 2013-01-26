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

  empresas = [
    { name: "Pulse Estética", phone: "62 81317530" }
    { name: "Estética Brasil", phone: "61 81638000" }
    { name: "Goiânia Estética", phone: "63 32611805" }
  ]

  class Empresa extends Backbone.Model
    defaults:
      name: "Empresa"
      phone: "00 0000 0000"

  class Empresas extends Backbone.Collection
    model: Empresa

    comparator: (model) ->
      model.get "name"

  class EmpresaView extends Backbone.View
    tagName: "div"
    template: _.template tmplEmpresa

    render: ->
      @$el.html @template @model.toJSON()


  class EmpresasView extends Backbone.View
    el: $("#companies")

    initialize: ->
      @collection = new Empresas empresas
      @render()

    render: ->
      @$el.html ""
      @renderSingle(item) for item in @collection.models

    renderSingle: (item) ->
      empresaView = new EmpresaView model : item
      @$el.append empresaView.render()


  window.empresas = new EmpresasView()

)