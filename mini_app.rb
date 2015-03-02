require "sinatra"
require 'sinatra-initializers'

class MiniApp < Sinatra::Base

    register Sinatra::Initializers
    post "/" do
        # status 400
        # body request.content_type.inspect
        test = JSON.parse request.body.read
        data = test.first

        if(data.has_key?('body') && data.has_key?('to') && data.has_key?('subject') && data.has_key?('token'))
            if data['token'] == '8e403727-d1cb-44f6-ad58-4fb1632faa67'
                # status 400
                # body data.inspect
                Thread.new {
                    body = data['body']
                    to = data['to']
                    subject = data['subject']
                    from = data['from'].nil? ? 'noreply@migas.esdm.go.id' : data['from']

                    Pony.mail(
                        :to => to,
                        :from => from,
                        :subject => subject,
                        :html_body => HTMLEntities.new.decode(body))
                }
            else
                status 400
                body data.inspect
            end
        else
            status 400
            body data.inspect
        end
    end

    get "/keepalive" do
        puts "keep alive shoted"
        "hore"
    end

end
