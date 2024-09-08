import nimx, nimx/widgets, nimx/graphics, nimx/geom

proc drawBarChart(canvas: Canvas, xVals, yVals: seq[float], barWidth: float) =
    let maxVal = yVals.max
    let barSpacing = 10.0
    let chartHeight = canvas.height.float

    for i, x in xVals.pairs:
        let barHeight = (yVals[i] / maxVal) * chartHeight
        let xPos = x * (barWidth + barSpacing)
        let yPos = chartHeight - barHeight
        canvas.drawRect(Rect(xPos, yPos, barWidth, barHeight), color = Colors.skyblue)

proc onPaint(canvas: Canvas) =
    let xVals = @[0, 1, 2, 3]
    let yVals = @[1/8.0, 3/8.0, 3/8.0, 1/8.0]
    let barWidth = 50.0
    drawBarChart(canvas, xVals, yVals, barWidth)

proc main() =
    let app = newApplication()
    let window = newWindow("Distribuição de Probabilidade - Lançamento de 3 Moedas", 800, 600)
    window.onPaint = onPaint
    app.run()

main()