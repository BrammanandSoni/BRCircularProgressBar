# BRCircularProgressBar
It shows circular progress for multi purpose like download, upload and timer progress.

![giphy](https://media.giphy.com/media/11qvJd5e127XSU/giphy.gif)


# Initialize BRCircularProgressView

    let progressView = BRCircularProgressView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    progressView.setCircleStrokeWidth(5)
    progressView.setCircleColor(UIColor.lightGray, circleBackgroundColor: UIColor.white, progressCircleColor: UIColor.blue, progressCircleBackgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
    progressView.setProgressTextFont(UIFont.systemFont(ofSize: 17), color: UIColor.green)
    progressView.setProgressText("50")

