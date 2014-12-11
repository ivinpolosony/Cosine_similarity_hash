require  'minitest/autorun'
require 'Cosine_similarity_hash'
class Test_Cosine_sim < MiniTest::Test

  def test_cos
    obj = Cosine_similarity_hash.new
    tf_idf = {"Document1.pdf"=>{"new"=>0.584, "york"=>0.584,"times"=>0.584,"post"=>0.0,"los"=>0.0, "angeles"=>0.0,},
               "Document2.pdf"=>{	"new"=>0.584,"york"=>0.584,	"post"=>1.584, "times"=>0.0,"los"=>0.0,  "angeles"=>0.0 },
               "Document3.pdf"=> { "los"=>1.584,  "angeles"=>1.584,   "times"=>0.584,"new"=>0.0,"york"=>0.0,"post"=>0.0}}

    doc_length = { "Document1.pdf"=> 1.011,"Document2.pdf"=>1.786,"Document3.pdf"=>2.316}

    query =  { "Document1.pdf"=>{ "new"=>0.584, "york"=>0.0,  "times"=>0.292, "post"=>0.0, "los"=>0.0, "angeles"=>0.0}}

    query_doc_length = { "Document1.pdf"=>0.652 }

    expected_output = {"Document1.pdf"=>0.7761009266170286, "Document2.pdf"=>0.29288467219478004, "Document3.pdf"=>0.11293005711137247}

    cos = obj.cosine_sim( tf_idf, query)
    assert_equal(expected_output, cos)
  end
end
