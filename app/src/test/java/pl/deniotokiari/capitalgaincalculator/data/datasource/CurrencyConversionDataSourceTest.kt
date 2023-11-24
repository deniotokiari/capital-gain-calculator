package pl.deniotokiari.capitalgaincalculator.data.datasource

import kotlinx.coroutines.test.runTest
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.mockito.kotlin.mock
import org.mockito.kotlin.whenever
import pl.deniotokiari.capitalgaincalculator.data.model.Currency
import pl.deniotokiari.capitalgaincalculator.data.service.yahoo.YahooFinanceService
import pl.deniotokiari.capitalgaincalculator.data.service.yahoo.model.Quote
import java.math.BigDecimal

class CurrencyConversionDataSourceTest {
    private lateinit var yahooFinanceService: YahooFinanceService
    private lateinit var sut: CurrencyYahooDataSource

    @Before
    fun setUp() {
        yahooFinanceService = mock()
        sut = CurrencyYahooDataSource(yahooFinanceService)
    }

    @Test
    fun `GIVEN USD to PLN WHEN conversionRate THEN return 3_99889`() = runTest {
        val from = Currency(name = "USD", code = Currency.Code("USD"), type = Currency.Type.Physical)
        val to = Currency(name = "PLN", code = Currency.Code("PLN"), type = Currency.Type.Physical)
        val quote: Quote = mock { quote ->
            val quoteResponse: Quote.QuoteResponse = mock { quoteResponse ->
                val result: List<Quote.QuoteResult> = mock { result ->
                    val quoteResult: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(3.99889)
                    }
                    whenever(result[0]).thenReturn(quoteResult)
                }
                whenever(quoteResponse.result).thenReturn(result)
            }
            whenever(quote.quoteResponse).thenReturn(quoteResponse)
        }
        whenever(yahooFinanceService.quote("USDPLN=X")).thenReturn(quote)

        val result = sut.conversionRate(from, to)

        assertEquals(BigDecimal(3.99889).toDouble(), result?.toDouble())
    }

    @Test
    fun `GIVEN PLN to DOT WHEN conversionRate THEN return 0_04785419246505833`() = runTest {
        val from = Currency(name = "PLN", code = Currency.Code("PLN"), type = Currency.Type.Physical)
        val to = Currency(name = "DOT", code = Currency.Code("DOT"), type = Currency.Type.Digital)
        val quote: Quote = mock { quote ->
            val quoteResponse: Quote.QuoteResponse = mock { quoteResponse ->
                val result: List<Quote.QuoteResult> = mock { result ->
                    val quoteResult0: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(0.2501063)
                    }
                    whenever(result[0]).thenReturn(quoteResult0)
                    val quoteResult1: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(5.226424)
                    }
                    whenever(result[1]).thenReturn(quoteResult1)
                }
                whenever(quoteResponse.result).thenReturn(result)
            }
            whenever(quote.quoteResponse).thenReturn(quoteResponse)
        }
        whenever(yahooFinanceService.quote("PLNUSD=X,DOT-USD")).thenReturn(quote)

        val result = sut.conversionRate(from, to)

        assertEquals(BigDecimal(0.04785419246505833).toDouble(), result?.toDouble())
    }

    @Test
    fun `GIVEN USD to DOT WHEN conversionRate THEN return 0_19133541404218257`() = runTest {
        val from = Currency(name = "USD", code = Currency.Code("USD"), type = Currency.Type.Physical)
        val to = Currency(name = "DOT", code = Currency.Code("DOT"), type = Currency.Type.Digital)
        val quote: Quote = mock { quote ->
            val quoteResponse: Quote.QuoteResponse = mock { quoteResponse ->
                val result: List<Quote.QuoteResult> = mock { result ->
                    val quoteResult0: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(5.226424)
                    }
                    whenever(result[0]).thenReturn(quoteResult0)
                }
                whenever(quoteResponse.result).thenReturn(result)
            }
            whenever(quote.quoteResponse).thenReturn(quoteResponse)
        }
        whenever(yahooFinanceService.quote("DOT-USD")).thenReturn(quote)

        val result = sut.conversionRate(from, to)

        assertEquals(BigDecimal(0.19133541404218257).toDouble(), result?.toDouble())
    }

    // DOT to PLN
    @Test
    fun `GIVEN DOT to PLN WHEN conversionRate THEN return 20_77268824504303`() = runTest {
        val from = Currency(name = "DOT", code = Currency.Code("DOT"), type = Currency.Type.Digital)
        val to = Currency(name = "PLN", code = Currency.Code("PLN"), type = Currency.Type.Physical)
        val quote: Quote = mock { quote ->
            val quoteResponse: Quote.QuoteResponse = mock { quoteResponse ->
                val result: List<Quote.QuoteResult> = mock { result ->
                    val quoteResult0: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(5.201585)
                    }
                    whenever(result[0]).thenReturn(quoteResult0)
                    val quoteResult1: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(0.250405)
                    }
                    whenever(result[1]).thenReturn(quoteResult1)
                }
                whenever(quoteResponse.result).thenReturn(result)
            }
            whenever(quote.quoteResponse).thenReturn(quoteResponse)
        }
        whenever(yahooFinanceService.quote("DOT-USD,PLNUSD=X")).thenReturn(quote)

        val result = sut.conversionRate(from, to)

        assertEquals(BigDecimal(20.77268824504303).toDouble(), result?.toDouble())
    }

    // DOT to USD
    @Test
    fun `GIVEN DOT to USD WHEN conversionRate THEN return 5_226424`() = runTest {
        val from = Currency(name = "DOT", code = Currency.Code("DOT"), type = Currency.Type.Digital)
        val to = Currency(name = "USD", code = Currency.Code("USD"), type = Currency.Type.Physical)
        val quote: Quote = mock { quote ->
            val quoteResponse: Quote.QuoteResponse = mock { quoteResponse ->
                val result: List<Quote.QuoteResult> = mock { result ->
                    val quoteResult0: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(5.226424)
                    }
                    whenever(result[0]).thenReturn(quoteResult0)
                }
                whenever(quoteResponse.result).thenReturn(result)
            }
            whenever(quote.quoteResponse).thenReturn(quoteResponse)
        }
        whenever(yahooFinanceService.quote("DOT-USD")).thenReturn(quote)

        val result = sut.conversionRate(from, to)

        assertEquals(BigDecimal(5.226424).toDouble(), result?.toDouble())
    }

    // DOT to BTC
    @Test
    fun `GIVEN DOT to BTC WHEN conversionRate THEN return 2_5`() = runTest {
        val from = Currency(name = "DOT", code = Currency.Code("DOT"), type = Currency.Type.Digital)
        val to = Currency(name = "BTC", code = Currency.Code("BTC"), type = Currency.Type.Digital)
        val quote: Quote = mock { quote ->
            val quoteResponse: Quote.QuoteResponse = mock { quoteResponse ->
                val result: List<Quote.QuoteResult> = mock { result ->
                    val quoteResult0: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(5.0)
                    }
                    whenever(result[0]).thenReturn(quoteResult0)
                    val quoteResult1: Quote.QuoteResult = mock { quoteResult ->
                        whenever(quoteResult.regularMarketPrice).thenReturn(2.0)
                    }
                    whenever(result[1]).thenReturn(quoteResult1)
                }
                whenever(quoteResponse.result).thenReturn(result)
            }
            whenever(quote.quoteResponse).thenReturn(quoteResponse)
        }
        whenever(yahooFinanceService.quote("DOT-USD,BTC-USD")).thenReturn(quote)

        val result = sut.conversionRate(from, to)

        assertEquals(BigDecimal(2.5).toDouble(), result?.toDouble())
    }
}