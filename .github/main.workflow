workflow "CI" {
  on = "push"
  resolves = ["run npm start", "run npm test", "run prettier check"]
}

action "install deps" {
  uses = "actions/npm@master"
  args = "ci"
}

action "run npm test" {
  needs = "install deps"
  uses = "actions/npm@master"
  args = "test"
}

action "run prettier check" {
  needs = "run npm test"
  uses = "actions/npm@master"
  args = "prettier:check"
}

action "run npm start" {
  needs = "run npm test"
  uses = "actions/npm@master"
  args = "start"
}
