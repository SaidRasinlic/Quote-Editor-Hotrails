// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
// To see how the app will behave without Hotwire, disable the Turbo Drive framework. With the following line:
// Turbo.session.drive = false // uncomment this line if you want to disable it, by default it's ON.
// Turbo.session.drive = false

// document.querySelectorAll('turbo-frame').forEach((el) => {
//   el.dataset.turbo = false
// });