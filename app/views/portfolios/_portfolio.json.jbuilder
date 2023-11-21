json.extract! portfolio, :id, :title, :about, :resources, :photos, :github_link, :website_link, :created_at, :updated_at
json.url portfolio_url(portfolio, format: :json)
