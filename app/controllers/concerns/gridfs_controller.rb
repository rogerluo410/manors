require 'mongo'
require 'mongoid/grid_fs'

class GridfsController < ActionController::Metal

    def serve
    gridfs_path = env["PATH_INFO"].gsub("/images/", "")
    begin
      gridfs_file = Mongoid::GridFS.[](gridfs_path)
      self.response_body = gridfs_file.data
      self.content_type = gridfs_file.contentType
    rescue
      self.status = :file_not_found
      self.content_type = 'text/plain'
      self.response_body = ''
    end
  end

end