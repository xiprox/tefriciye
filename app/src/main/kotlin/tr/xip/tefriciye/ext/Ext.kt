package tr.xip.tefriciye.ext

import android.content.Context

fun Number.toDp(context: Context): Int {
    return (this.toFloat() / context.resources.displayMetrics.density).toInt()
}

fun Number.toPx(context: Context): Int {
    return (this.toFloat() * context.resources.displayMetrics.density).toInt()
}