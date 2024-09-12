mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-ensure-allowed-root-resource-or-module-fail.mock"
  }
}

test {
    rules = {
        main = false
    }
}