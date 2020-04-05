import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../components/", true, /_controller\.js$/)
const definitions = definitionsFromContext(context)

definitions.map(definition => {
  definition["identifier"] = definition["identifier"].replace(/--[a-z]+(-[a-z]+)?$/, "")

  return definition
})

application.load(definitions)
