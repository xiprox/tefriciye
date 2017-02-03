package tr.xip.tefriciye.ui.adapter

import android.content.Context
import android.support.v4.view.PagerAdapter
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import kotlinx.android.synthetic.main.card_arabic.view.*
import tr.xip.tefriciye.R

class CardsPagerAdapter(val context: Context, val rootLayout: ViewGroup) : PagerAdapter() {

    override fun instantiateItem(collection: ViewGroup, position: Int): Any {
        val resId = if (position == 0) R.layout.card_arabic else R.layout.card_reading
        val layout = LayoutInflater.from(context).inflate(resId, collection, false)
        if (position == 0) {
//            adjustCardDimens(layout)
        }
        collection.addView(layout)
        return layout
    }

    private fun adjustCardDimens(layout: View) {
        val cardWidth = (rootLayout.width - 2 * context.resources.getDimension(R.dimen.activity_horizontal_margin)).toInt()
        val cardHeight = (cardWidth / 1.77).toInt() // image ratio
        layout.arabicCard.layoutParams.width = cardWidth
        layout.arabicCard.layoutParams.height = cardHeight
    }

    override fun destroyItem(collection: ViewGroup, position: Int, view: Any) {
        collection.removeView(view as View)
    }

    override fun getCount() = 2

    override fun isViewFromObject(view: View, obj: Any): Boolean {
        return view === obj
    }
}