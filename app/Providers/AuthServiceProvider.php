<?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Gate;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        // 'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        // 超級管理員 Gate 規則
        Gate::define('super', function ($user) {
            return $user->role === 1;
        });

        // 一般管理員 Gate 規則
        Gate::define('admin', function ($user) {
            return $user->role === 2;
        });

        // 一般會員 Gate 規則
        Gate::define('user', function ($user) {
            return $user->role === 3;
        });
    }
}
