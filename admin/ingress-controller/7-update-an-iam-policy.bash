export FILEN=update-ingress-controller-iam-policy.json
cat <<EOF > ${FILEN}
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:*",
                "ec2:Describe*",
                "ec2:ModifyInstanceAttribute",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSubnets",
                "ec2:DescribeVpcs",
                "ec2:CreateSecurityGroup",
                "ec2:DeleteSecurityGroup",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeNetworkInterfaces",
                "ec2:CreateTags",
                "ec2:RevokeSecurityGroupIngress",
                "iam:ListAttachedRolePolicies",
                "iam:ListRoles",
                "iam:ListPolicyVersions",
                "iam:ListAttachedUserPolicies",
                "iam:ListUserPolicies",
                "iam:GetPolicy",
                "iam:GetPolicyVersion",
                "iam:GetUser",
                "iam:ListAttachedGroupPolicies",
                "iam:GetGroup",
                "iam:ListGroupPolicies",
                "iam:GetPolicyVersion",
                "iam:ListRolePolicies",
                "iam:GetRole",
                "iam:ListRoleTags",
                "iam:GetRolePolicy",
                "iam:ListUserTags",
                "iam:GetUserPolicy",
                "iam:ListUserPolicies",
                "iam:ListRoleTags",
                "iam:ListGroupTags",
                "iam:ListRolePolicies",
                "shield:GetSubscriptionState"
            ],
            "Resource": "*"
        }
    ]
}

EOF
set -x
aws iam update-policy --policy-name AWSLoadBalancerControllerIAMPolicy --policy-document file://${FILEN}


POLICY_ARN=arn:aws:iam::104984342949:policy/AWSLoadBalancerControllerIAMPolicy
aws iam create-policy-version --policy-arn ${POLICY_ARN} --policy-document file://${FILEN} --set-as-default
#aws iam delete-policy-version --policy-arn ${POLICY_ARN} --version-id v6
