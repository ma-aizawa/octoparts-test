require 'spec_helper'
require 'json'

describe Octoparts do
  let(:client) { Octoparts::Client.new }
  let(:response) { double(:response, status: 200, body: body, headers: []) }
  let(:body) { '{"result": "ok"}' }

  it do
    expect(client).to be_instance_of(Octoparts::Client)
  end

  it do
    allow_any_instance_of(Octoparts::Client).to receive(:post).with(
      Octoparts::Client::OCTOPARTS_API_ENDPOINT_PATH,
      JSON.dump(
        requests: [{
          part_id: '',
          params: []
        }]
      ),
      content_type: 'application/json'
    ).and_return(response)
    result = client.invoke(
      requests: [{
        part_id: '',
      }]
    )
    expect(result.body).not_to be_nil
  end
end
