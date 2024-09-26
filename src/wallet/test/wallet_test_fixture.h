// Copyright (c) 2016 The Bitcoin Core developers
// Copyright (c) 2017-2019 The FTM Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef FTM_WALLET_TEST_FIXTURE_H
#define FTM_WALLET_TEST_FIXTURE_H

#include "test/test_ftm.h"

/** Testing setup and teardown for wallet.
 */
struct WalletTestingSetup : public TestingSetup
{
    explicit WalletTestingSetup(const std::string &chainName = CBaseChainParams::MAIN);

    ~WalletTestingSetup();
};

#endif

