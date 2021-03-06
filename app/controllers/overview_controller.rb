class OverviewController < ApplicationController
  before_filter :authorize
  before_filter :get_programming_languages, :get_orientations

	def index
    @companies = []

    @internships = Internship.all

    @internships.each do |i|
      @companies << i.company
    end

    @pins = @companies.to_gmaps4rails do |company, marker |

      href =  if company.website.starts_with?'http' 
              company.website  
            else 
              "http://"+company.website 
             end
             
      marker.infowindow ("<a href='/companies/#{company.id}' style='font-weight:bold'>#{company.name}</a><p>Industry: #{company.industry}</p><p>Employees: #{company.number_employees}</p><a href='#{href}' target='_blank'>#{company.website}</a>")

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @internships }
    end
  end

end
