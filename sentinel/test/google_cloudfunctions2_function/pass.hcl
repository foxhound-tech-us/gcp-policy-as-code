mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-cloudfunctions2-function-pass.sentinel"
  }
}

test {
    rules = {
        main = true
    }
}