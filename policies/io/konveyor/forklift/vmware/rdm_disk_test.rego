package io.konveyor.forklift.vmware

test_with_no_disks {
    mock_vm := {
        "name": "test",
        "disks": []
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_no_shareable_disk {
    mock_vm := {
        "name": "test",
        "disks": [
            { "rdm": false }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 0
}

test_with_shareable_disk {
    mock_vm := {
        "name": "test",
        "disks": [
            { "rdm": false },
            { "rdm": true },
            { "rdm": false }
        ]
    }
    results := concerns with input as mock_vm
    count(results) == 1
}
