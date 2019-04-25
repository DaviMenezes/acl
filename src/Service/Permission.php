<?php

namespace Dvi\Support\Acl\Service;

use Dvi\Acl\Model\ActionTypes;
use Dvi\Acl\Model\GroupActions;
use Dvi\Acl\Model\Groups;
use Dvi\Acl\Model\Modules;
use Dvi\Acl\Model\UserActions;
use Dvi\Acl\Model\UserGroups;

/**
 *  AclPermission
 *
 * @package
 * @subpackage
 * @author     Davi Menezes
 * @copyright  Copyright (c) 2018. (davimenezes.dev@gmail.com)
 * @see https://github.com/DaviMenezes
 */
abstract class Permission
{
    public function __call($method, $arguments)
    {
        //enable if also works with database permissions
        /*$hasPermissionGroup = $this->hasPermissionGroup($method);
        $hasUserPermission = $this->hasUserPermission($method);

        if (!$hasPermissionGroup and !$hasUserPermission) {
            return false;
        }*/

        $method = $this->prepareMethodName($method);
        if ($this->methodExtraValidationExists($method, $arguments)) {
            return call_user_func_array([$this, $method], $arguments);
        }
        return false;
    }

    protected function prepareMethodName($name): string
    {
        $array_undescore = explode('_', $name);

        $name = '';
        foreach ($array_undescore as $item) {
            $name .= ucfirst($item);
        }

        return 'can'.$name;
    }

    protected function methodExtraValidationExists($method, $arguments)
    {
        if (method_exists($this, $method)) {
           return true;
        }
        return false;
    }

    protected function hasPermissionGroup($permission): bool
    {
        $group_result = UserGroups::db('aug')
            ->select(['aug.user_id', 'ag.name', 'am.name', 'aat.name as action'])
            ->join(Groups::TABLENAME.' as ag', 'aug.group_id', '=', 'ag.id')
            ->join(GroupActions::TABLENAME.' as aga', 'ag.id', '=', 'aga.group_id')
            ->join(ActionTypes::TABLENAME.' as aat', 'aga.action_id', '=', 'aat.id')
            ->join(Modules::TABLENAME.' as am', 'aat.module_id', '=', 'am.id')
            ->where('aug.user_id', '=', loggedUser()->id)
            ->where('aat.name', '=', $permission)
            ->count();
        return $group_result > 0 ? true : false;
    }

    protected function hasUserPermission($permission): bool
    {
        $result = UserActions::db('aup')
            ->leftJoin(ActionTypes::TABLENAME . ' as auat', 'aup.action_id', '=', 'auat.id')
            ->where('aup.user_id', '=', loggedUser()->id)
            ->where('auat.name', '=', $permission)
            ->count();

        return $result > 0 ? true : false;
    }
}
