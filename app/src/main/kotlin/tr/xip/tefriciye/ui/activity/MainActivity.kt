package tr.xip.tefriciye.ui.activity

import android.annotation.SuppressLint
import android.content.Context
import android.content.SharedPreferences
import android.os.Bundle
import android.support.v4.view.ViewPager
import android.support.v7.app.AppCompatActivity
import android.view.ViewTreeObserver
import kotlinx.android.synthetic.main.activity_main.*
import tr.xip.tefriciye.R
import tr.xip.tefriciye.ui.adapter.CardsPagerAdapter
import tr.xip.tefriciye.ui.widget.FlipPageViewTransformer

@SuppressLint("CommitPrefEdits")
class MainActivity : AppCompatActivity() {

    private var sharedPref: SharedPreferences? = null

    private var count = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        sharedPref = getSharedPreferences("prefs", Context.MODE_PRIVATE)

        /* UI initializations */
        pager.setPageTransformer(false, FlipPageViewTransformer())
        pager.addOnPageChangeListener(object : ViewPager.OnPageChangeListener {
            override fun onPageScrollStateChanged(state: Int) {}

            override fun onPageScrolled(position: Int, positionOffset: Float, positionOffsetPixels: Int) {}

            override fun onPageSelected(position: Int) {
                savePagePosition(position)
            }
        })

        root.viewTreeObserver.addOnGlobalLayoutListener(object : ViewTreeObserver.OnGlobalLayoutListener {
            override fun onGlobalLayout() {
                pager.adapter = CardsPagerAdapter(this@MainActivity, root)
                pager.currentItem = loadPagePosition()
                root.viewTreeObserver.removeGlobalOnLayoutListener(this)
            }
        })

        /* Load saved data */
        counter.text = "${loadCount()}"

        /* UI listeners */
        flipCard.setOnClickListener {
            pager.currentItem = if (pager.currentItem == 0) 1 else 0
        }

        counterBackground.setOnClickListener {
            plus()
        }

        reset.setOnClickListener {
            minus(count)
        }

        minus1.setOnClickListener {
            minus()
        }

        plus1.setOnClickListener {
            plus()
        }
    }

    private fun plus(amount: Int = 1) {
        if (count == 99999) return

        count += Math.abs(amount)
        notifyCountChanged()
    }

    private fun minus(amount: Int = 1) {
        if (count == 0) return

        count -= Math.abs(amount)
        notifyCountChanged()
    }

    private fun notifyCountChanged() {
        saveCount()
        counter.text = "$count"
    }

    private fun loadCount(): Int {
        count = sharedPref?.getInt("counter", 0) ?: 0
        return count
    }

    private fun saveCount() {
        sharedPref?.edit()?.putInt("counter", count)?.commit()
    }

    private fun loadPagePosition(): Int {
        return sharedPref?.getInt("page_position", 0) ?: 0
    }

    private fun savePagePosition(position: Int) {
        if (position < 0 || position > 1) return
        sharedPref?.edit()?.putInt("page_position", position)?.commit()
    }
}
