// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "trix"
import "@rails/actiontext"
import { Application } from '@hotwired/stimulus'
import NestedForm from 'stimulus-rails-nested-form'

const application = Application.start()
application.register('nested-form', NestedForm)
