mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-ensure-allowed-root-resource-or-module-pass.mock"
  }
}

test {
    rules = {
        main = true
    }
}