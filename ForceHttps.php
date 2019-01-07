<?php

namespace Ecrmnn\LaravelHttps\Http\Middleware;

use Closure;

class ForceHttps
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if (config('https.force') === true and
            (
                !$request->secure() or
                (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) and $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'http')
            )
        ) {
            if (substr($request->header('Host'), 0, 4)  !== 'www.') {
               $request->headers->set('Host', 'www.neonstunami.com.au');
            }
            return redirect()->secure($request->path());
        }

        return $next($request);
    }
}
