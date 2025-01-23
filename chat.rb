require "openai"
require "dotenv/load"

client=OpenAI::Client.new(access_token: ENV.fetch("OPENAI_API_KEY"))

message_list = [
  {
    "role" => "system",
    "content" => "You are a helpful assistant."
  }
]

pp "Hello! How can I help you today?"
pp "--------------------------------------------------"
user_input = gets.chomp

while user_input != "bye"
  request = {
    "role" => "system",
    "content" => user_input
  }
 
  message_list.push(request)

  api_response = client.chat(
    parameters: {
      model: "gpt-3.5-turbo",
      messages: message_list
    }
  )

  pp api_response["choices"][0]["message"]["content"]
  pp "--------------------------------------------------"
  user_input = gets.chomp
end
