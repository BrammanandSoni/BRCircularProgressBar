# BRCircularProgressBar
It shows circular progress for multi purpose like download, upload and timer progress.

![giphy](https://media.giphy.com/media/11qvJd5e127XSU/giphy.gif)


# Initialize BRCircularProgressView

    let progressView = BRCircularProgressView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    progressView.setCircleStrokeWidth(5)
    progressView.setCircleColor(UIColor.lightGray, circleBackgroundColor: UIColor.white, progressCircleColor: UIColor.blue, progressCircleBackgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.3))
    progressView.setProgressTextFont(UIFont.systemFont(ofSize: 17), color: UIColor.green)
    progressView.setProgressText("50")

# Description

This control can be used for multi purpose like:
Showing download progress,
Showing upload progress,
Showing timer with an interval.

And this is fully configurable, you can set the different color of each part of the progress bar like
circleColor,
circleBackgroundColor,
progressCircleColor,
progressCircleBackgroundColor.

![Alt text](https://github.com/BrammanandSoni/BRCircularProgressBar/blob/master/BRCircularProgressBar/info.png)
