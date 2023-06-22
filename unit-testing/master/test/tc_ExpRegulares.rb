require 'test/unit'
require 'lib/ExpRegulares'

class TestExpRegulares < Test::Unit::TestCase
  def setup
    @expre1 = ExpRegulares.new('a')
    @expre2 = ExpRegulares.new('b')
  end

  def test_simple
    assert_equal('a', @expre1.cad1)
    assert_equal('b', @expre2.cad1)
  end

  def test_concatencacion
    assert_equal("a.b", @expre1.concatenacion(@expre2).cad1)
    assert_equal("a.b.a", @expre1.concatenacion(@expre2).concatenacion(@expre1).cad1)
  end

  def test_alternativa
    assert_equal("a|b", @expre1.alternativa(@expre2).cad1)
  end

  def test_kleener
    assert_equal("a*", @expre1.kleener.cad1)
    assert_equal("b*", @expre2.kleener.cad1)
  end

  def test_complejo
    assert_equal("a.b.a|a", @expre1.concatenacion(@expre2).concatenacion(@expre1).alternativa(@expre1).cad1)
    assert_equal("(a.b|b.a)*.a", @expre1.concatenacion(@expre2).alternativa(@expre2.concatenacion(@expre1)).kleener.concatenacion(@expre1).cad1)
  end
end