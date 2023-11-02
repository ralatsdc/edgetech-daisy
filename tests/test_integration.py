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

    # Remove empty end messages
    output_expected.pop()
    output_actual.pop()

    # Remove timestamps from assertion
    for i, output in enumerate(output_expected):
        output_expected
        assert (
            {key: output_expected[i]["message_content"][key] for key in output_expected[i]["message_content"] if key != "PushTimestamp"}
            == {key: output_actual[i]["message_content"][key] for key in output_actual[i]["message_content"] if key != "PushTimestamp"}
        )

