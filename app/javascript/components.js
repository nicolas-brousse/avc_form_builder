import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("../components/", true, /_controller\.js$/)
const definitions = definitionsFromContext(context)

definitions.map(definition => {
  definition["identifier"] = definition["identifier"].replace(/--/g, "_")
    .replace(/_[a-z-]+$/, "")
    .replace(/_/g, "--")

  return definition
})

application.load(definitions)
