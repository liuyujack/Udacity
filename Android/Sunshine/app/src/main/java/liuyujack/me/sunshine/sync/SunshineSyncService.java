package liuyujack.me.sunshine.sync;

import android.app.Service;
import android.content.Intent;
import android.os.IBinder;
import android.support.annotation.Nullable;
import android.util.Log;

/**
 * Created by uczll11 on 13/01/2016.
 */
public class SunshineSyncService extends Service {
    private static final Object sSyncAdapterLock = new Object();
    private static SunshineSyncAdapter sSunshineSyncAdapter = null;

    public SunshineSyncService() {
        super();
    }

    @Override
    public void onCreate() {
        Log.d("SunshineSyncService","onCreate - SunshineSyncService");
        synchronized (sSyncAdapterLock){
            if(sSunshineSyncAdapter == null){
                sSunshineSyncAdapter = new SunshineSyncAdapter(getApplicationContext(),true);
            }
        }
        super.onCreate();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return sSunshineSyncAdapter.getSyncAdapterBinder();
    }
}
