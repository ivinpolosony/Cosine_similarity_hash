class Cosine_similarity_hash
	def cosine_sim( tf_idf ,query)
		@tf_idf = tf_idf
    	@doc_length = self.length(@tf_idf)
    	@query = query
    	@query_doc_length = self.length(@query)
		@hashCosine = {}

		@tf_idf.each do |hash| #docs 
			docname = hash[0]
			word_cnt_hash = hash[1]
			sum = 0 
			word_cnt_hash.each do |word_cnt|
				word = word_cnt[0]
				count = word_cnt[1]
				if @query.values.first.has_key?("#{word}")
					 mult = @query.values.first["#{word}"].to_f * count.to_f 
					 sum = sum + mult
				end 	
			end
			 doc_length	= @doc_length["#{docname}"]
			 query_length  =   @query_doc_length.values[0]
			 deno = doc_length* query_length
			@hashCosine["#{docname}"] = sum/deno 
		end 
		
		return @hashCosine
	end  #cosine_sim()	

	def length(tf_idf)
		@tf_idf = tf_idf 
		@hashLength = {}
		    @tf_idf.each do |hash| #docs 
		    	docname = hash[0]
				word_cnt_hash = hash[1]
				sum = 0
				word_cnt_hash.each do |word_cnt|
					 word = word_cnt[0]
					 count = word_cnt[1]
					sqr = count**2
					sum = sum + sqr  
				end
				@hashLength["#{docname}"] = Math.sqrt(sum)  
		    end 
		    return @hashLength
	end # length() 
end #Class  




# SAMPLE INPUT 
=begin





obj = Cosine_similarity_hash.new 
@tf_idf = {
			"Document1.pdf"=>
					{
					"new"=>0.584, 
					"york"=>0.584, 
					"times"=>0.584, 
					"post"=>0.0, 
					"los"=>0.0, 
					"angeles"=>0.0,
					
					}, 
		    "Document2.pdf"=>
		    		{
		    		"new"=>0.584, 
		    		"york"=>0.584, 
		    		"post"=>1.584, 
		    		"times"=>0.0, 
		    		"los"=>0.0, 
		    		"angeles"=>0.0
		    		}, 
		    "Document3.pdf"=>
			    {
			    	"los"=>1.584, 
			    	"angeles"=>1.584, 
			    	"times"=>0.584, 
			    	"new"=>0.0, 
			    	"york"=>0.0, 
			    	"post"=>0.0
			    }
		    }

	@doc_length = {
					"Document1.pdf"=> 1.011, 
					"Document2.pdf"=>1.786, 
					"Document3.pdf"=>2.316
				   }

	@query =  {
			"Document1.pdf"=>
					{
					"new"=>0.584, 
					"york"=>0.0, 
					"times"=>0.292, 
					"post"=>0.0, 
					"los"=>0.0, 
					"angeles"=>0.0
					}
			 }

	@query_doc_length = {
							"Document1.pdf"=>0.652
						}

	p obj.cosine_sim( @tf_idf ,  @query  )
=end
