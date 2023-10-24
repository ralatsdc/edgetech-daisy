import json


def test_integration() -> None:
    """
    Tests integration of the message handler with the MQTT client. Designed to be run after docker-compose.test.yaml.
    Recommended to run from test.sh.
    """
    # Confirm output is same as expected output
    with open("test-data/test-expected-output.json") as expected_output_file:
        output_expected = json.load(expected_output_file)
    with open("test-data/test-output.json") as output_file:
        output_actual = json.load(output_file)

    assert output_expected == output_actual
