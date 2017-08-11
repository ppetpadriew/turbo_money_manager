<?php
namespace Turbo\MoneyManager\Helpers;

class DateTime extends \DateTime
{
    public function now($format = 'Y-m-d H:i:s'): string
    {
        return date($format, time());
    }

    public function firstDateOfMonth(string $month = null)
    {
        $month = $month ?? 'm';
        return $this->now('Y-'.$month.'-d');
    }

    public function lastDateOfMonth(string $month = null)
    {
        $month = $month ?? 'm';
        return $this->now('Y-'.$month.'-t');
    }
}
